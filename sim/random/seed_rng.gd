class_name SeedRNG


var rng = RandomNumberGenerator.new()


func init_seed(seed_value: String):
	rng.seed = hash(seed_value)


func weighted(choices: Array, weights: PackedFloat32Array):
	var index := rng.rand_weighted(weights)
	return choices[index]


func chance(p: float) -> bool:
	return rng.randf() < p
