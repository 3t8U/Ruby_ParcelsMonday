require 'rspec'
require 'parcel'

describe '#Parcel' do
  before(:each) do
    Parcel.clear()
  end

  describe('#==') do
  it("is the same package if it has the same attributes as another package") do
    package = Parcel.new([1,2,3], 20, nil)
    package2 = Parcel.new([1,2,3], 20, nil)
    expect(package).to(eq(package2))
  end
end

  describe('.clear') do
    it("Clears all packages") do
      package = Parcel.new([0,0,0], 0, nil)
      package.save()
      package2 = Parcel.new([0,0,0], 0, nil)
      package2.save()
      Parcel.clear()
      expect(Parcel.all).to(eq([]))
    end

    describe ('#save') do
      it("Saves a parcel") do
        package = Parcel.new([1,3,5], 25, nil)
        package.save()
        package2 = Parcel.new([2,1,5], 15, nil)
        package2.save()
        expect(Parcel.all).to(eq([package, package2]))
      end
    end

    describe('#delete') do
      it("deletes a parcel by id") do
        package = Parcel.new([1,2,3], 25, nil)
        package.save()
        package2 = Parcel.new([4,5,6], 100, nil)
        package2.save()
        package.delete()
        expect(Parcel.all).to(eq([package2]))
      end
    end

    describe('.all') do
      it("returns an empty array when there are no albums") do
        expect(Parcel.all).to(eq([]))
      end
    end

    describe('.find') do
      it("finds an package by id") do
        package = Parcel.new([1,2,3], 25, nil)
        package.save()
        package2 = Parcel.new([1,2,3], 25, nil)
        package2.save()
        expect(Parcel.find(package.id)).to(eq(package))
      end
    end

    describe('#update') do
      it("updates a parcel id") do
        package = Parcel.new([1,2,3], 25, nil)
        package.save()
        package.update([2,3,4], 40)
        expect(package.dimensions).to(eq([2,3,4]))
        expect(package.weight).to(eq(40))
        expect(package.id).to(eq(1))
      end
    end

  end





























end
