; Michael Peres 7/12/2023 Program, Dealing with AI Planning and Scheduling.


; Handle the problem that we need to deal with.

;Header and description

(define (domain blocksworld)


    ; (:fluents
    ;     ;this is a single predicate, and agruments should be constants, these may change in the world over time.
    ;     ; conjunction of ground fluents represents the state, what conjunction means is that all of the fluents are true at the same time.
    ;     ; none
    ;     ; example fluent is:
    ;     (At Truck1 Melbourne)  ; this is true right now, but may change in the future.

    ; ) 
    (:requirements :typing :fluents :negative-preconditions)
    
    (:types
        block  ; types here, these are our objects, tangible things in the world, like car, task, homework, recording.
        ; recording
        ; lab
        ; tutorial
        ; coursework
        ; notes
    )


    (:predicates ;todo: define predicates here
        ; predicates here.
        ; there represent a relationship between objects, and can be true or false, but these objects must be constants.
        ; for example the following is a predicate, At(Truck1, Melbourne) - this is true if the truck is in Melbourne, and false otherwise.
        ; fluents like ~Poor or At(x,y) is not allowed.
        
        ; will give use a true or false, we have worked with these before.
        (on ?a ?b - block)  ; if a is on b, then this is true, in which the variable a and b are of type block.
        (clear ?a - block)  ; if a is clear on top then this is true, in which the variable a is of type block.
        (ontable ?a - block) ; block a is on table.
        (holding ?a - block) ; block a is being held.
        (handempty) ; hand is empty, checks if hand is empty or currently holding something.
 
        ;(is ?a - recording ?b - block) ; if a is a recording, and b is a block, then this is true.

    )


    (:functions ;todo: define numeric functions here
        ; functions are different to actions, here we represent numeric quantities or values that chage during excution of actions. 
        ; not properly understood yet so leave this for now.
        ; these are important for consumers and other resources.
    )

    ;define actions here

    ; actions are things that contain a name, a list of parameters, preconditions about the wrodl, and the effect this action has.
    ; this effects what happens in the world, and can produce a new state which is a conjunction of fluents.

    (:action pickup   ; pickup a block from the table that is clear and hand is empty.
        :parameters (?a - block)
        :precondition (and 
            (clear ?a)  ; to pick up a block, there must not be anything above, clear, and should be on table and should have hand empty.
            (ontable ?a)
            (handempty)
        )
        :effect (and
            (not (ontable ?a))  ; we want to say ontable is false for a, hand is not empty, and we are currently holding the block.
            (not (handempty))
            (holding ?a)
            ; also assume block is no longer clear because picked up.
            (not (clear ?a))
        )
    )

    (:action unstack;
        :parameters (?a ?b - block)  ; we are removing b from a, unstacking it. 
        :precondition ( and   ; to do this action we require b to be on a, we need b to be clear. and hands empty.
            (on ?a ?b)
            (clear ?a)
            (handempty)
        )
        :effect (and 
            ; what do we want this function to do.
            (holding ?a)
			(not (handempty))
			(not (clear ?a))
			(clear ?b)
			(not (on ?a ?b))
        )
    )

    (:action putdown
		:parameters (?a - block)
		:precondition (and
			(holding ?a)
		)
		:effect (and
			(ontable ?a)
			(not (holding ?a))
			(handempty)
			(clear ?a)
		)
	)

	(:action stack
		:parameters (?a ?b - block)
		:precondition (and
			(holding ?a)
			(clear ?b)
		)
		:effect (and
			(on ?a ?b)
			(not (holding ?a))
			(handempty)
			(not (clear ?b))
			(clear ?a)
		)
	)
    
	
    ; ok now we know the states, the predicates and everything that can occur on the state such as the different actions that can occur. 
	; now we need a problem, such that the problem solver can get this for us.
	
)