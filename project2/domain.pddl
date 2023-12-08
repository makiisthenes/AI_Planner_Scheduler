;Header and description

; this has a lot of use cases, which we can use, this is that we can obtain a plan given a bunch of possible actions we can do, and the current states.
; We can also include temporal and resources to make planning that is complex more easier to deal with.


; We have an environment, in which our world is our deadline, courseworks etc, todos.
; We will only have reusables with timing constraints. 
; Each task will have a deadline and we aim to complete with the objective of less workload and stress overtime.
; Dont know if we can use timing, exact datetime, to do such a thing.


(define (domain qmul_planner)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        recording
        task
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (iswatching ?a - recording )
        (watched ?a - recording)
        (currently_watching)
        (task_requires_recording ?a - recording ?b - task)
        (isreleased ?a - recording)  ; only release when time is exactly a given.
    )


    (:functions ;todo: define numeric functions here
        
    )

    ;define actions here
    
    (:action watch_recording
        :parameters (
            ?a - recording
        )
        :precondition (and 
            (not (currently_watching))
            (not (watched ?a))
            (not (iswatching ?a ))
        )
        :effect (and 
            (currently_watching)
            (iswatching ?a )
            (watched ?a)
        )
    )
    

)