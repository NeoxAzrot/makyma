module CategoriesHelper
  def remaining_objects(objects)
    objects.total_count - objects.to_a.count - objects.offset_value
  end
end
