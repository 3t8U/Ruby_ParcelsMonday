class Parcel
  attr_reader :id
  attr_accessor :dimensions, :weight

  @@manifest = {}
  @@total_rows = 0

  def initialize(dimensions, weight, id)
    @dimensions = dimensions
    @weight = weight
    @id = id || @@total_rows += 1
  end

  def save
    @@manifest[self.id] = Parcel.new(self.dimensions, self.weight, self.id)
  end

  def self.all
    @@manifest.values()
  end

  def self.clear
    @@manifest = {}
    @@total_rows = 0
  end

  def delete
    @@manifest.delete(self.id)
  end

  def ==(parcel_to_compare)
    self.id() == parcel_to_compare.id()
    self.dimensions() == parcel_to_compare.dimensions()
    self.weight() == parcel_to_compare.weight()
    #needed to pass save test (fixes id issue)
  end

  def self.find(id)
    @@manifest[id]
  end

  def update(dimensions, weight)
    @dimensions = dimensions
    @weight = weight
  end

end
