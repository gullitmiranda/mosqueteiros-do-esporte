ActiveAdmin.register Payment do
  menu label: 'Pagamentos'
  
  filter :amount
  filter :project

  controller do
    def scoped_collection
      Payment.completed
    end
  end

  index do
    column :id

    column :amount, sortable: :amount do |payment|
      number_to_currency(payment.amount, precision: 0)
    end

    column :project, sortable: :project_id do |payment|
      link_to payment.project.title, admin_project_path(payment.project)
    end

    column :user, sortable: :user_id do |payment|
      link_to payment.user.name, admin_user_path(payment.user)
    end

    column 'Data', sortable: :updated_at do |payment|
      l payment.updated_at, format: :short
    end
  end
end
