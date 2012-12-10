# encoding: utf-8

ActiveAdmin.register Project do
  menu label: 'Projetos'
  
  filter :title
  filter :category
  filter :goal
  filter :expires_at
  filter :name
  filter :location
  
  index do
    column :id
    column :title
    column :category
    column :success, sortable: :success do |project|
      (project.success? ? '<span class="label success">Sim</span>' : '<span class="label">Não</span>').html_safe
    end

    column :published, sortable: :published do |project|
      (project.published? ? '<span class="label success">Sim</span>' : '<span class="label">Não</span>').html_safe
    end
    column :featured, sortable: :featured do |project|
      (project.featured? ? '<span class="label success">Sim</span>' : '<span class="label">Não</span>').html_safe
    end
    column :goal, sortable: :goal do |project|
      number_to_currency(project.goal)
    end
    column :expires_at, sortable: :expires_at do |project|
      l project.expires_at
    end
    default_actions
  end
  
  show title: :title do |project|
    attributes_table do
      row :title
      row :category
      row :image do
        image_tag(project.image.regular, width: 640, height: 430)
      end
      row :video do
        project.video.try(:html_safe)
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
