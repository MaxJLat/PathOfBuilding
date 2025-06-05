describe("TestAccCalc #tag", function()
	before_each(function()
		newBuild()
	end)

	teardown(function()
		-- newBuild() takes care of resetting everything in setup()
	end)
    
    it("test when accDiff = 0, no minimum accuracy calculation should happen", function()
        build.configTab.input.customMods = "\z
        +3657 to accuracy\n\z
        "
        build.configTab:BuildModList()
        build.calcsTab:BuildOutput()
        runCallback("OnFrame")
        local accuracyHitChance = build.calcsTab.calcsEnv.player.breakdown.MainHand.AccuracyHitChance
        assert.is_not_nil(accuracyHitChance)
        local minAccLine = ""
        assert.are.equals(minAccLine, accuracyHitChance[4])
    end)

    it("test with positive accuracy", function()
        build.configTab:BuildModList()
        build.calcsTab:BuildOutput()
        runCallback("OnFrame")
        local accuracyHitChance = build.calcsTab.calcsEnv.player.breakdown.MainHand.AccuracyHitChance
        assert.is_not_nil(accuracyHitChance)
        local minAccLine = "Required accuracy for 100%%: %d (%d%% inc Acc / %s to Acc)"
        minAccLine = string.format(minAccLine,3697, 9143, "+3657")
        assert.are.equals(minAccLine, accuracyHitChance[4])
    end)
    it("test negative accuracy", function()
        build.configTab.input.customMods = "\z
		-60 to accuracy\n\z
		"
        build.configTab:BuildModList()
        build.calcsTab:BuildOutput()
        runCallback("OnFrame")
        local accuracyHitChance = build.calcsTab.calcsEnv.player.breakdown.MainHand.AccuracyHitChance
        assert.is_not_nil(accuracyHitChance)
        local minAccLine = "Required accuracy for 100%%: %d (%d%% inc Acc / %s to Acc)"
        minAccLine = string.format(minAccLine, 3697, 0, "+3717")
        assert.are.equals(minAccLine, accuracyHitChance[4])
    end)
    it("test with 0 accuracy", function()
        build.configTab.input.customMods = "\z
		-40 to accuracy\n\z
		"
        build.configTab:BuildModList()
        build.calcsTab:BuildOutput()
        runCallback("OnFrame")
        local accuracyHitChance = build.calcsTab.calcsEnv.player.breakdown.MainHand.AccuracyHitChance
        assert.is_not_nil(accuracyHitChance)
        local minAccLine = "Required accuracy for 100%%: %d (%d%% inc Acc / %s to Acc)"
        minAccLine = string.format(minAccLine, 3697, 0, "+3697")
        assert.are.equals(minAccLine, accuracyHitChance[4])
    end)
    it("test with reduced accuracy", function()
        build.configTab.input.customMods = "\z
		40% reduced accuracy\n\z
		"
        build.configTab:BuildModList()
        build.calcsTab:BuildOutput()
        runCallback("OnFrame")
        local accuracyHitChance = build.calcsTab.calcsEnv.player.breakdown.MainHand.AccuracyHitChance
        assert.is_not_nil(accuracyHitChance)
        local minAccLine = "Required accuracy for 100%%: %d (%d%% inc Acc / %s to Acc)"
        minAccLine = string.format(minAccLine, 3697, 9183, "+6122")
        assert.are.equals(minAccLine, accuracyHitChance[4])
    end)
    it("test with increased accuracy", function()
        build.configTab.input.customMods = "\z
		40% increased accuracy\n\z
		"
        build.configTab:BuildModList()
        build.calcsTab:BuildOutput()
        runCallback("OnFrame")
        local accuracyHitChance = build.calcsTab.calcsEnv.player.breakdown.MainHand.AccuracyHitChance
        assert.is_not_nil(accuracyHitChance)
        local minAccLine = "Required accuracy for 100%%: %d (%d%% inc Acc / %s to Acc)"
        minAccLine = string.format(minAccLine, 3697, 9103, "+2601")
        assert.are.equals(minAccLine, accuracyHitChance[4])
    end)
    it("test with accuracy less accuracy", function()
        build.configTab.input.customMods = "\z
		40% less accuracy\n\z
		"
        build.configTab:BuildModList()
        build.calcsTab:BuildOutput()
        runCallback("OnFrame")
        local accuracyHitChance = build.calcsTab.calcsEnv.player.breakdown.MainHand.AccuracyHitChance
        assert.is_not_nil(accuracyHitChance)
        local minAccLine = "Required accuracy for 100%%: %d (%d%% inc Acc / %s to Acc)"
        minAccLine = string.format(minAccLine, 3697, 15304, "+6122")
        assert.are.equals(minAccLine, accuracyHitChance[4])
    end)
    it("test with accuracy more accuracy", function()
        build.configTab.input.customMods = "\z
		40% more accuracy\n\z
		"
        build.configTab:BuildModList()
        build.calcsTab:BuildOutput()
        runCallback("OnFrame")
        local accuracyHitChance = build.calcsTab.calcsEnv.player.breakdown.MainHand.AccuracyHitChance
        assert.is_not_nil(accuracyHitChance)
        local minAccLine = "Required accuracy for 100%%: %d (%d%% inc Acc / %s to Acc)"
        minAccLine = string.format(minAccLine, 3697, 6502, "+2601")
        assert.are.equals(minAccLine, accuracyHitChance[4])
    end)
    
end)