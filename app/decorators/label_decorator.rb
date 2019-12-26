class LabelDecorator < Draper::Decorator
  delegate_all

  def row_color
      overweight <= 0 ? 'green' : 'white'
  end
  
  def overweight_value 
    overweight <= 0 ? '**NO**' : overweight
  end
end
