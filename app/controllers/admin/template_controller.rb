module Admin
  class TemplateController < ApplicationController
    before_action :set_deal
    before_action :set_template, except: %w[create select_unblind]

    def create
      @template = Template.new(name: 'Primeiro Template', user: current_user)

      respond_to do |format|
        if @template.save
          @deal.template = @template
          @deal.save(validate: false)
          format.html { redirect_to admin_deal_editor_path(@deal, template_id: @template) }
        end
      end
    end

    def select
      @deal.template = @template
      respond_to do |format|
        if @deal.save(validate: false)
          format.html { redirect_to admin_deal_step_2_path(@deal) }
        end
      end
    end

    def update
      respond_to do |format|
        if @template.update(params.require('template').permit([:name, :isFavorite]))
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace(
              helpers.dom_id(@template).to_s,
              partial: 'admin/deals/template',
              locals: { deal: @deal, template: @template }
            )
          end
        end
      end
    end

    def select_unblind
      @template = current_user.templates.create(name: 'Meu Template Unblind')

      cabecalho = @template.section_cabecalho
      cabecalho.position = 1
      cabecalho['theme']['colors']['overlay'] = '#000000'
      cabecalho.background_image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/sections/cabecalho/img.png')), filename: 'cabecalho.png', content_type: 'image/png')
      cabecalho.save

      about_us_section = Admin::Editor::AboutUsSection.new(@template)
      about_us_section.position = 2
      about_us_section.save

      step_by_step_section = Admin::Editor::StepByStepSection.new(@template)
      step_by_step_section.position = 3
      cabecalho.background_image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/sections/step_by_step/img.png')), filename: 'step_by_step.png', content_type: 'image/png')
      step_by_step_section.save

      team_section = Admin::Editor::TeamSection.new(@template)
      team_section.position = 4
      team_section.save

      portfolio_section = Admin::Editor::PortfolioSection.new(@template)
      portfolio_section.position = 5
      portfolio_section.save

      propostas = @template.section_propostas
      propostas.position = 6
      propostas.save

      our_clients_section = Admin::Editor::OurClientsSection.new(@template)
      our_clients_section.position = 7
      our_clients_section.save

      faqs_section = Admin::Editor::FaqsSection.new(@template)
      faqs_section.position = 8
      faqs_section.save

      contacto = @template.section_contacto
      contacto.position = 9
      contacto.save

      @deal.template = @template
      respond_to do |format|
        if @deal.save(validate: false)
          format.html { redirect_to admin_deal_editor_path(@deal, template_id: @template) }
        end
      end
    end

    def destroy
      respond_to do |format|
        if @template.update(isFavorite: false)
          format.html { redirect_to step_2_admin_deal_path(@deal) }
        end
      end
    end

    private

    def set_deal
      @deal = Deal.find(params[:deal_id])
    end

    def set_template
      @template = Template.find(params[:id])
    end

  end
end
