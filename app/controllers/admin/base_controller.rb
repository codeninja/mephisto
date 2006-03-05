class Admin::BaseController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required, :except => :feed

  def find_templates_and_resources!
    @resources, @templates = Theme.find_current.partition do |asset|
      asset.is_a?(Resource)
    end
    @resources = @resources.sort_by { |r| r.full_path }
    @images, @resources = @resources.partition { |r| r.image? }
  end
end
