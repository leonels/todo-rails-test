module ListsHelper

def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new # Task.new 
    id = new_object.object_id # generate unique value 
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      # render 'task_fields', :f => builder
      render(association.to_s.singularize + "_fields", f: builder)
    end
    # link_to(name, '#', "add_fields is the javascript function on lists.js", data: {id: id, fields: fields.gsub("\n", "")})
    # link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')")
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_remove_task(name, f)
  	f.hidden_field(:_destroy) + link_to_function(name, "remove_task(this)", :class => "delete btn btn-default glyphicon glyphicon-remove")
  end

end
