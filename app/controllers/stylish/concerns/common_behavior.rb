module Stylish
  module CommonBehavior
    extend ActiveSupport::Concern

    included do
      before_filter :find_object, only: [:edit, :update, :destroy]
      before_filter :new_object, only: [:new, :create]

      def index
        instance_variable_set("@#{controller_name}", object_class.all)
      end

      def new; end

      def create
        respond_to do |format|
          if object.save
            format.html { redirect_to controller: controller_name, action: :index }
            format.json { render head: :ok }
          else
            format.html { render :new }
            format.json { render json: object.errors }
          end
        end
      end

      def edit; end

      def update
        service = Stylish::ServiceFactory.instance.get(object_params[:act].to_sym, object, object_params)
        if service.call
          flash[:info] = 'cool'
        else
          flash[:error] = object.errors.full_messages.join(', ')
        end

        redirect_to action: :index
      end

      def destroy
        respond_to do |format|
          if object.destroy
            format.html { redirect_to controller: controller_name, action: :index }
            format.json { render head: :ok }
          else
            format.html { redirect_to controller: controller_name, action: :index }
            format.json { render json: object.errors }
          end
        end
      end

      private

      def object
        instance_variable_get("@#{controller_name.singularize}")
      end

      def set_object(value)
        instance_variable_set("@#{controller_name.singularize}", value)
      end

      def find_object
        set_object(object_class.find(params[:id]))
      end

      def new_object
        set_object(object_class.new(object_params))
      end

      def object_params
        params.fetch(controller_name.singularize.to_sym, {})
      end

      def object_class
        Stylish::ModelFactory.instance.get_class(controller_name)
      end
    end
  end
end
