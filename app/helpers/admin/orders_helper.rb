module Admin::OrdersHelper
  def display_color_status status
    {
      "pending" => "text-primary",
      "approved" => "text-success",
      "processing" => "text-info",
      "rejected" => "text-primary"
    }[status]
  end
end
