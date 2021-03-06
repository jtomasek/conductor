#
#   Copyright 2011 Red Hat, Inc.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class CreateRealms < ActiveRecord::Migration
  def self.up
    create_table :realms do |t|
      t.string  :external_key, :null => false
      t.string  :name, :null => false, :limit => 1024
      t.integer :provider_id
      t.integer :lock_version, :default => 0
      t.timestamps
    end

    create_table "realm_map", :force => true, :id => false do |t|
      t.column "frontend_realm_id", :integer
      t.column "backend_realm_id", :integer
    end
  end

  def self.down
    drop_table :realm_map
    drop_table :realms
  end
end
