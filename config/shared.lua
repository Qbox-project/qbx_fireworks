return {
    detonationTime = 5, -- Time in seconds to wait after placement till detonation
    needLighter = true, -- If true, player needs the lighter item on their person to place the firework

    ---@alias FireworkAssetName string
    ---@type table<FireworkAssetName, {itemName: string, particleList: string[]}>
    fireworks = { -- List of fireworks
        proj_indep_firework = {
            itemName = 'firework1',
            particleList = {
                'scr_indep_firework_grd_burst',
                'scr_indep_launcher_sparkle_spawn',
                'scr_indep_firework_air_burst',
                'proj_indep_flare_trail',
            },
        },
        proj_indep_firework_v2 = {
            itemName = 'firework2',
            particleList = {
                'scr_firework_indep_burst_rwb',
                'scr_firework_indep_spiral_burst_rwb',
                'scr_xmas_firework_sparkle_spawn',
                'scr_firework_indep_ring_burst_rwb',
                'scr_xmas_firework_burst_fizzle',
                'scr_firework_indep_repeat_burst_rwb',
            },
        },
        proj_xmas_firework = {
            itemName = 'firework3',
            particleList = {
                'scr_firework_xmas_ring_burst_rgw',
                'scr_firework_xmas_burst_rgw',
                'scr_firework_xmas_repeat_burst_rgw',
                'scr_firework_xmas_spiral_burst_rgw',
                'scr_xmas_firework_sparkle_spawn',
            },
        },
        scr_indep_fireworks = {
            itemName = 'firework4',
            particleList = {
                'scr_indep_firework_sparkle_spawn',
                'scr_indep_firework_starburst',
                'scr_indep_firework_shotburst',
                'scr_indep_firework_trailburst',
                'scr_indep_firework_trailburst_spawn',
                'scr_indep_firework_burst_spawn',
                'scr_indep_firework_trail_spawn',
                'scr_indep_firework_fountain',
            },
        },
    },
}