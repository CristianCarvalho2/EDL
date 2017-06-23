import Html exposing (text)

type Exp = Num Int
           | Add Exp Exp
           | Sub Exp Exp
           | Mult Exp Exp
           | Div Exp Exp
           | Var String
           | Igual Exp Exp
           | MaiorQue Exp Exp
           | MenorQue Exp Exp
           | Diferente Exp Exp
           | MaiorIgual Exp Exp
           | MenorIgual Exp Exp
           
type alias Env = (String -> Int) 
zero : Env
zero id = 0


avaliarExp: Exp -> Env -> Int
avaliarExp exp env =
    case exp of 
      Num n                -> n
      Var id               -> env id
      Add exp1  exp2       -> (avaliarExp exp1 env) + (avaliarExp exp2 env)
      Sub exp1  exp2       -> (avaliarExp exp1 env) - (avaliarExp exp2 env)
      Mult exp1 exp2       -> (avaliarExp exp1 env) * (avaliarExp exp2 env)
      Div exp1 exp2        -> (avaliarExp exp1 env) // (avaliarExp exp2 env)
      Igual exp1 exp2      -> if (avaliarExp exp1 env) == (avaliarExp exp2 env) then
                              1
                           else
                              0
      MaiorQue exp1 exp2   -> if (avaliarExp exp1 env) > (avaliarExp exp2 env) then
                              1
                           else
                              0
      MenorQue exp1 exp2   -> if (avaliarExp exp1 env) < (avaliarExp exp2 env) then
                              1
                           else
                              0
      Diferente exp1 exp2      -> if (avaliarExp exp1 env) /= (avaliarExp exp2 env) then
                              1
                           else
                              0
      MaiorIgual exp1 exp2      -> if (((avaliarExp exp1 env) > (avaliarExp exp2 env)) || ((avaliarExp exp1 env) == (avaliarExp exp2 env))) then
                              1
                           else   
                              0
      MenorIgual exp1 exp2      -> if (((avaliarExp exp1 env) < (avaliarExp exp2 env)) || ((avaliarExp exp1 env) == (avaliarExp exp2 env))) then
                              1
                           else   
                              0
      
      
type Prog = Attr String Exp
            | Seq Prog Prog
            | If Exp Prog Prog
            | While Exp Prog
            
                        

avaliarProg : Prog -> Env -> Env
avaliarProg prog env =
        case prog of
            Attr id exp ->
                let
                      val = (avaliarExp exp env)
                in
                      \ask -> if ask==id then val else (env ask)
            Seq prog1 prog2 ->
                let
                      env2 = (avaliarProg prog1 env)
                in
                      (avaliarProg prog2 env2)
            If compara prog1 prog2   ->
                if (avaliarExp compara env) /= 0 then
                    (avaliarProg prog1 env)
                else
                    (avaliarProg prog2 env)
            While compara loop   ->
                if (avaliarExp compara env) == 0 then
                    env
                else
                    (avaliarProg (Seq loop prog) env)        
                   

ling : Prog -> Int
ling prog = ((avaliarProg prog zero) "ret")
p1 = (Attr "ret" (Num 1))
p2 = (Seq(Attr "x" (Div (Num 8) (Num 2))) (Attr "ret" (Var "x")))
p3 = (If (MenorIgual (Num 4) (Num 3)) (Attr "ret" (Num 14)) ((Attr "ret" (Num 81))))
p4 = (Seq(Attr "x" (Add (Num 8) (Num 2))) (Attr "ret" (Var "x")))
p5 = (If (Igual (Num 5) (Num 5)) (Attr "ret" (Sub(Num 4)(Num 2))) (Attr "ret" (Mult(Num 4)(Num 2))))
p6 = (Seq (Seq (Attr "x" (Num 5)) (Seq (Attr "i" (Num 10)) (While (MaiorIgual (Var "i") (Num 7)) (Seq (Attr "x" (Mult (Var "x") (Num 2))) (Attr "i" (Sub (Var "i") (Num 1)))))))(Attr "ret" (Var "x")))
p7 = (If (Diferente (Num 8) (Num 6)) (Attr "ret" (Add(Num 4)(Num 2))) (Attr "ret" (Mult(Num 4)(Num 2))))
p8 = (If (MaiorQue (Num 8) (Num 6)) (Attr "ret" (Num 1)) (Attr "ret" (Num 0)))
p9 = (If (MenorQue (Num 7) (Num 7)) (Attr "ret" (Num 1)) (Attr "ret" (Num 0)))

main = text(toString (ling p9))
