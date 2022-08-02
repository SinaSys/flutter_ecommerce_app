enum CategoricalType { small, medium, large }

class Categorical {
  CategoricalType categorical;
  bool isSelected = false;

  Categorical(this.categorical, this.isSelected);
}
