class AddDefaultValueToInvitationStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :invitations, :status, :string, :default=>"pending"
  end
end
