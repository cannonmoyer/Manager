class AddJobRefToPage < ActiveRecord::Migration
  def change
    add_reference :pages, :job, index: true, foreign_key: true
  end
end
