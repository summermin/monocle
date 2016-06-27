class AddPaymentAmountToProjectsAndCauses < ActiveRecord::Migration
  def change
    add_column :projects, :payment_amount, :decimal, precision: 8, scale: 2
    add_column :project_causes, :checkin_wager_amount, :decimal, precision: 3, scale: 2
  end
end
