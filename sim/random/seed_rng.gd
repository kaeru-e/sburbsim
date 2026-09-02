class_name SeedRNG


var rng = RandomNumberGenerator.new()


func init_seed(seed_value: String):
	rng.seed = hash(seed_value)


#uses built in godot function
func weighted(choices: Array, weights: PackedFloat32Array):
	var index := rng.rand_weighted(weights)
	return choices[index]


#chance function
func chance(p: float) -> bool:
	return rng.randf() < p


#one seed makes it so one scene change will affect overall RNG, so this is for future changes
func derive(context: String) -> SeedRNG:
	var child := SeedRNG.new()
	child.init_seed(str(rng.seed) + "::" + context)
	return child
