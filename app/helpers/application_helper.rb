module ApplicationHelper
  def formato_bs(monto)
    monto = 0 unless monto.present?
    number_to_currency(monto, unit: 'Bs.', separator: ',', delimiter: '', presicion: 2, format: '%n %u')
  end
end
