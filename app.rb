require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
require('pry')
also_reload('lib/**/*.rb')


get('/') do
  @manifest = Parcel.all
  erb(:parcels)
end

get('/parcels') do
  # binding.pry
  @manifest = Parcel.all
  erb(:parcels)
end

get('/parcels/new') do
  erb(:new_parcel)
end

post('/parcels') do
  dimension_h = params[:package_dimension_h]
  dimension_w = params[:package_dimension_w]
  dimensions_l = params[:package_dimension_l]
  weight = params[:package_weight]
  package = Parcel.new([dimension_x, dimension_y, dimensions_z], weight, nil)
  package.save()
  @manifest = Parcel.all()
  erb(:parcels)
end

get('/parcels/:id') do
  @package = Parcel.find(params[:id].to_i())
  erb(:parcel)
end

get('/parcels/:id/edit') do
@package = Parcel.find(params[:id].to_i())
erb(:edit_parcel)
end

patch('/parcels/:id') do
@package  = Parcel.find(params[:id].to_i())
@package.update(params[:name])
@manifest = Parcel.all
erb(:parcels)
end

delete('/parcels/:id') do
  @package = Parcel.find(params[:id].to_i())
  @package.delete()
  @manifest = Parcel.all
  erb(:parcels)
end

# get('/custom_route') do
#   "We can even create custom routes, but we should only do this when needed."
# end
