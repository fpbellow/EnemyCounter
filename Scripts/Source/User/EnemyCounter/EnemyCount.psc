Scriptname EnemyCounter:EnemyCount extends activemagiceffect

Form Property Consumible Auto Const
Message Property EnemyCounter_NoneMsg Auto
Message Property EnemyCounter_LowMsg Auto
Message Property EnemyCounter_MedMsg Auto
Message Property EnemyCounter_HighMsg Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	While (Utility.IsInMenuMode())
		Utility.Wait(0.5)
	EndWhile
	Game.GetPlayer().AddItem(Consumible, 1, True)
	Actor[] targets = akTarget.GetAllCombatTargets()
	debug.trace(targets.length)
	if (targets.length ==0 || !targets) 
		EnemyCounter_NoneMsg.show()
	endif 	
	if (targets.length < 3 && targets.length > 0) 
		EnemyCounter_LowMsg.show()
	endif 
	if (targets.length < 6 && targets.length > 3)
		EnemyCounter_MedMsg.show()
	endif
	if targets.length > 6
		EnemyCounter_HighMsg.show()
	endif
EndEvent