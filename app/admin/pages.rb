# encoding: utf-8

ActiveAdmin.register Page do
  menu label: 'Páginas'
  
  filter :title
  filter :body
  
  index do
    column :id
    column :title
    column :published, sortable: :published do |page|
      (page.published? ? '<span class="label success">Sim</span>' : '<span class="label">Não</span>').html_safe
    end
    default_actions
  end

  show title: :title do |page|
    attributes_table do
      row :title
      row :slug
      row :body do
        simple_format(page.body)
      end
    end
  end
end
