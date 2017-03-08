class Backoffice::DiagramController < BackofficeController

  def index
    %x(bundle exec erd --filename='public/diagram')
  end

end
