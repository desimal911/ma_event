ActiveAdmin.register Event do
  permit_params :title, :body, :category

  index do
    selectable_column
    id_column
    column :title
    column :category
    actions
  end

  filter :title
  filter :category

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :category
    end
    f.actions
  end
end
