name = "Supply Drop"
description = "Drops supplies to players at spawn."
author = "Muted"
version = "1" 
forumthread = "" 
-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10 
-- Can specify a custom icon for this mod! (atlas for xml - icon for tex)
icon_atlas = ""
icon = "" 

-- Specify compatibility with the game!
dst_compatible = true
all_clients_require_mod = false
configuration_options =
{	
	{
        name = "day_interval",
        label = "Day Interval",
        options =    {
			{description = "0", data = 0},
                        {description = "1", data = 1},
                        {description = "2", data = 2},
                        {description = "3", data = 3},
                        {description = "4", data = 4},
                        {description = "5", data = 5},
                        {description = "6", data = 6},
			{description = "7", data = 7},
			{description = "8", data = 8},
			{description = "9", data = 9},
			{description = "10", data = 10},
			{description = "11", data = 11},
			{description = "12", data = 12},
			{description = "13", data = 13},
			{description = "14", data = 14},
			{description = "15", data = 15},
                    }, 
        default = 0,
    },
	{
        name = "food_amt",
        label = "Food Amount",
        options =    {
			{description = "0", data = 0},
                        {description = "2", data = 2},
                        {description = "4", data = 4},
                        {description = "6", data = 6},
                        {description = "8", data = 8},
                        {description = "10", data = 10},
                        {description = "12", data = 12},
			{description = "14", data = 14},
			{description = "16", data = 16},
			{description = "18", data = 18},
			{description = "20", data = 20},
			{description = "22", data = 22},
			{description = "24", data = 24},
			{description = "26", data = 26},
			{description = "28", data = 28},
			{description = "30", data = 30},
                    }, 
        default = 5,
    },
	{
        name = "armor_amt",
        label = "Armor Amount",
        options =    {
			{description = "0", data = 0},
                        {description = "1", data = 1},
                        {description = "2", data = 2},
                        {description = "3", data = 3},
                        {description = "4", data = 4},
                        {description = "5", data = 5},
                        {description = "6", data = 6},
			{description = "7", data = 7},
			{description = "8", data = 8},
			{description = "9", data = 9},
			{description = "10", data = 10},
			{description = "11", data = 11},
			{description = "12", data = 12},
			{description = "13", data = 13},
			{description = "14", data = 14},
			{description = "15", data = 15},
                    }, 
        default = 0,
    },
	{
        name = "hambat_amt",
        label = "Hambat Amount",
        options =    {
			{description = "0", data = 0},
                        {description = "1", data = 1},
                        {description = "2", data = 2},
                        {description = "3", data = 3},
                        {description = "4", data = 4},
                        {description = "5", data = 5},
                        {description = "6", data = 6},
			{description = "7", data = 7},
			{description = "8", data = 8},
			{description = "9", data = 9},
			{description = "10", data = 10},
			{description = "11", data = 11},
			{description = "12", data = 12},
			{description = "13", data = 13},
			{description = "14", data = 14},
			{description = "15", data = 15},
                    }, 
        default = 0,
    },
	{
        name = "lives_amt",
        label = "Life Amulet Amount",
        options =    {
			{description = "0", data = 0},
                        {description = "1", data = 1},
                        {description = "2", data = 2},
                        {description = "3", data = 3},
                        {description = "4", data = 4},
                        {description = "5", data = 5},
                        {description = "6", data = 6},
			{description = "7", data = 7},
			{description = "8", data = 8},
			{description = "9", data = 9},
			{description = "10", data = 10},
			{description = "11", data = 11},
			{description = "12", data = 12},
			{description = "13", data = 13},
			{description = "14", data = 14},
			{description = "15", data = 15},
                    }, 
        default = 0,
    }
} 