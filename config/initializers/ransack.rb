Ransack.configure do |c|
  c.custom_arrows = {
    up_arrow: "<i class='fa fa-arrow-circle-up' aria-hidden='true'></i>",
    down_arrow: "<i class='fa fa-arrow-circle-down' aria-hidden='true'></i>",
    default_arrow: "<i class='fa fa-arrow-circle-down' aria-hidden='true'></i>"
  }

  # c.add_predicate 'between',
  #   arel_predicate: 'between',
  #   formatter: proc { |v|
  #     parts = v.split(',')
  #     OpenStruct.new(begin: parts[0], end: parts[1])
  #   },
  #   validator: proc { |v| v.present? },
  #   type: :string
end
