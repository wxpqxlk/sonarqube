#
# Sonar, entreprise quality control tool.
# Copyright (C) 2008-2012 SonarSource
# mailto:contact AT sonarsource DOT com
#
# Sonar is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 3 of the License, or (at your option) any later version.
#
# Sonar is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with Sonar; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02
#

#
# Sonar 3.0
#
class AddDefaultDescriptionToManualRules < ActiveRecord::Migration
  
  class Rule < ActiveRecord::Base
  end
  
  def self.up
    Rule.reset_column_information
    Rule.update_all(Rule.sanitize_sql_for_assignment({:description => 'Rule created on the fly. A description should be provided.'}), 
                    "description IS null AND plugin_name = 'manual'")
  end

end
