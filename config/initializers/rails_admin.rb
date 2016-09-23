RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # unless current_user.try(:is_admin)
  #   flash[:error] = "You are not an admin"
  #   redirect_to main_app.root_path
  # end

  ## == Cancan ==
   config.authorize_with :cancan  #TODO add cancancan to rails_admin config


  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.model 'Order' do

    field :order_type
    field :product do
      inline_add false
      inline_edit false
    end
    field :user do
      inline_add false
      inline_edit false
    end
    field :quantity
    field :price
    field :deleted_at
  end

  config.model 'Product' do
    exclude_fields :orders
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    #bulk_delete
    show
    edit
    delete
    #show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
