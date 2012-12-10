# encoding: utf-8

ActiveAdmin.register User do
  menu label: 'Usuários'
  
  filter :nome
  filter :email

  index do
    column :id
    column :avatar do |user|
      image_tag(user.avatar.thumb, width: 24)
    end
    column :name
    column :email
    column 'Investidor' do |user|
      (user.payments.any? ? '<span class="label success">Sim</span>' : '<span class="label">Não</span>').html_safe
    end
  end
  
  show title: :name do |user|
    attributes_table do
      row :avatar do
        image_tag(user.avatar.thumb, width: 24)
      end
      row :name
      row :email
      row 'Investidor' do
        (user.payments.any? ? '<span class="label success">Sim</span>' : '<span class="label">Não</span>').html_safe
      end
      row 'Total investido' do
        number_to_currency(user.payments.completed.pluck(:amount).sum, precision: 0)
      end
      row 'Crédito' do
        number_to_currency(user.credit, precision: 0)
      end
    end
  end
  
end
