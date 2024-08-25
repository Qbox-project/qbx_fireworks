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

    shows = {
        ['lsia'] = { -- location for command
            fireworks = {
                {
                    asset = 'scr_indep_fireworks',            --  Firework asset name, must be from above
                    coords = vec3(-1415.34, -3203.85, 13.94), -- location of firework, if adding more -1 the z axis
                    height = 50.0,                            -- z axis + height for the firework explosion to happen
                    wait = 4000                                  -- delay in ms before next firework spawn
                },
                {
                    asset = 'proj_xmas_firework',
                    coords = vec3(-1399.17, -3212.7, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1385.2, -3220.6, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1373.94, -3226.76, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'proj_indep_firework_v2',
                    coords = vec3(-1373.94, -3226.76, 13.94),
                    height = 70.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1385.2, -3220.6, 13.94),
                    height = 45.0,
                    wait = 4000
                },
                {
                    asset = 'proj_xmas_firework',
                    coords = vec3(-1399.17, -3212.7, 13.94),
                    height = 45.0,
                    wait = 4000
                },
                {
                    asset = 'proj_indep_firework_v2',
                    coords = vec3(-1415.34, -3203.85, 13.94),
                    height = 70.0,
                    wait = 4000
                },
                {
                    asset = 'proj_xmas_firework',
                    coords = vec3(-1399.17, -3212.7, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1385.2, -3220.6, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1373.94, -3226.76, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'proj_indep_firework_v2',
                    coords = vec3(-1373.94, -3226.76, 13.94),
                    height = 70.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1385.2, -3220.6, 13.94),
                    height = 45.0,
                    wait = 4000
                },
                {
                    asset = 'proj_xmas_firework',
                    coords = vec3(-1399.17, -3212.7, 13.94),
                    height = 45.0,
                    wait = 4000
                },
                {
                    asset = 'proj_indep_firework_v2',
                    coords = vec3(-1415.34, -3203.85, 13.94),
                    height = 70.0,
                    wait = 4000
                },
                {
                    asset = 'proj_xmas_firework',
                    coords = vec3(-1399.17, -3212.7, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1385.2, -3220.6, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1373.94, -3226.76, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'proj_indep_firework_v2',
                    coords = vec3(-1373.94, -3226.76, 13.94),
                    height = 70.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1385.2, -3220.6, 13.94),
                    height = 45.0,
                    wait = 4000
                },
                {
                    asset = 'proj_xmas_firework',
                    coords = vec3(-1399.17, -3212.7, 13.94),
                    height = 45.0,
                    wait = 4000
                },
                {
                    asset = 'proj_indep_firework_v2',
                    coords = vec3(-1415.34, -3203.85, 13.94),
                    height = 70.0,
                    wait = 4000
                },
                {
                    asset = 'proj_xmas_firework',
                    coords = vec3(-1399.17, -3212.7, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1385.2, -3220.6, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1373.94, -3226.76, 13.94),
                    height = 50.0,
                    wait = 4000
                },
                {
                    asset = 'proj_indep_firework_v2',
                    coords = vec3(-1373.94, -3226.76, 13.94),
                    height = 70.0,
                    wait = 4000
                },
                {
                    asset = 'scr_indep_fireworks',
                    coords = vec3(-1385.2, -3220.6, 13.94),
                    height = 45.0,
                    wait = 4000
                },
                {
                    asset = 'proj_xmas_firework',
                    coords = vec3(-1399.17, -3212.7, 13.94),
                    height = 45.0,
                    wait = 4000
                },
                {
                    asset = 'proj_indep_firework_v2',
                    coords = vec3(-1415.34, -3203.85, 13.94),
                    height = 70.0,
                    wait = 4000
                },
            },
        }
    }
}