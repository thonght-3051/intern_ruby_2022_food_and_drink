Ransack.configure do |c|
  c.custom_arrows = {
    up_arrow: "<i class='fa fa-arrow-circle-up' aria-hidden='true'></i>",
    down_arrow: "<i class='fa fa-arrow-circle-down' aria-hidden='true'></i>",
    default_arrow: "<i class='fa fa-arrow-circle-down' aria-hidden='true'></i>"
  }

  c.add_predicate 'date_equals',
    arel_predicate: 'eq',
    formatter: proc {|v| v.to_date},
    validator: proc {|v| v.present?},
    type: :string
end
