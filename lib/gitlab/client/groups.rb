class Gitlab::Client
  # Defines methods related to groups.
  module Groups
    # Gets a list of groups.
    #
    # @example
    #   Gitlab.groups
    #   Gitlab.groups(:per_page => 40)
    #
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # @return [Array<Gitlab::ObjectifiedHash>]
    def groups(options={})
      get("/groups", :query => options)
    end

    # Gets a single group.
    #
    # @example
    #   Gitlab.group(42)
    #
    # @param  [Integer] id The ID of a group.
    # @return [Gitlab::ObjectifiedHash]
    def group(id)
      get("/groups/#{id}")
    end

    # Creates a new group
    #
    # @param  [String] name The name of a group.
    # @param  [String] path The path of a group.
    # @return [Gitlab::ObjectifiedHash] Information about created group.
    def create_group(name, path)
      body = {:name => name, :path => path}
      post("/groups", :body => body)
    end

    # Transfers a project to a group
    #
    # @param  [Integer] id The ID of a group.
    # @param  [Integer] project_id The ID of a project.
    def transfer_project_to_group(id, project_id)
      body = {:id => id, :project_id => project_id}
      post("/groups/#{id}/projects/#{project_id}", :body => body)
    end
  end
end