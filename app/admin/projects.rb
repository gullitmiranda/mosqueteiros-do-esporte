ActiveAdmin.register Project do
  menu label: 'Projetos'
  
  filter :title
  filter :goal
  filter :expires_at
  filter :name
  filter :location
  
  index do
    column :id
    column :title
    column :goal, sortable: :goal do |project|
      number_to_currency(project.goal)
    end
    column :expires_at
    default_actions
  end
  
  show title: :title do |project|
    attributes_table do
      row :title
      row :image do
        image_tag(project.image.regular, width: 640, height: 430)
      end
      row :video do
        project.video.html_safe
      end
      row :excerpt
      row :body do
        simple_format(project.body)
      end
      row :goal do
        number_to_currency(project.goal)
      end
      row :expires_at
      row :name
      row :location
    end
  end

end
