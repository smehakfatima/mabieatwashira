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

  config.navigation_static_links = {
      'Reports' => 'https://hussaingroupofcompanies.herokuapp.com/summary'
  }

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
    field :dealer do
      inline_add false
      inline_edit false
    end
    field :quantity
    field :price
    field :created_at do
      label "Ordered At"
    end
    field :deleted_at do
      help 'To delete this record set the date here'
    end
    field :comments ,  :text do
      html_attributes do
        {:rows=> 3, :cols => 50}
      end
    end
    # export do
    #   field :order_type
    #   field :product , :string do
    #     export_value do
    #       value.name if value #value is an instance of Teacher
    #     end
    #   end
    #   field :user, :string do
    #     export_value do
    #       value.name if value #value is an instance of Teacher
    #     end
    #   end
    #
    #   field :quantity
    # end

    update do
      exclude_fields :created_at
    end
    create do
      exclude_fields :deleted_at, :created_at
    end
  end

  config.model 'Product' do
    exclude_fields :orders, :original_stock, :created_at, :updated_at
    field :name
    field :description , :text do
      html_attributes do
        {:rows=> 3, :cols => 50}
      end
    end
    field :price
    field :in_stock
    field :deleted_at  do
      help 'To delete this record set the date here'
    end
    create do
      exclude_fields :deleted_at
    end
    # update do
    #   exclude_fields :in_stock
    # end
    list do
      exclude_fields :description
    end
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
