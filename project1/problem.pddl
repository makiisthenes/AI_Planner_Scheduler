(define (problem blocks)(:domain blocksworld)
    (:objects
        ; define some objects which are instances of these types.
        red green blue yellow brown pink - block
    )
    
    ; init state.
    (:init
        ; only specific the predicates that are true.
        ; we are defining the world state within this init block.
        ; tower 1.
        (ontable red)     ; on table red block
        (on green red)    ; put green block onto red block.
        (on blue green)   ; put blue block on green block.
        (clear blue)      ; clear blue block, nothing on top of it.

        ; tower 2.
        (ontable yellow)  ; on table yellow block. 
        (on brown yellow) ; on brown block on top of yellow block.
        (on pink brown)   ; on pink block on top of brown block.
        (clear pink)      ; clear pink block, nothing on top of it.

        ; init state of hand.
        (handempty)       ; setting that hands are empty. 
    )


    ; goal state. This is what we want, we told the different states we can go to through actions.
    ; (:goal 
    ;     (and
    ;         (on red brown)    ; red block on brown block.
    ;         (on green red)    ; green on the red block.
    ;         (holding yellow)  ; holding the yellow block.
    ;     )
    ; )
    (:goal (and
    (on red brown)
    (on green red)
    (holding yellow)
    ))
    ; the planner will obtain taks that we should do.
)


; One problem is that,
; Actions may require resources, such as consumables, reusables
; Reusables like pilots
; Consumables like fuel.
; We can start by making a plan, which has some ordering constraints.
; We then have scheduling phase, which we add temporal info to plan,
;  meet resource and deadline constraints.
; https://www.youtube.com/watch?v=EXdRAF9Yea8&list=PL1Q0jeuU6XppS_r2Sa9fzVanpbXKqLsYS&index=2
; https://www.youtube.com/watch?v=AlVfaK-z2Qg&list=PL1Q0jeuU6XppS_r2Sa9fzVanpbXKqLsYS&index=3&pp=iAQB