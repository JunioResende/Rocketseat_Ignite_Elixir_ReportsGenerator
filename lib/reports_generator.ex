defmodule ReportsGenerator do
  def build(filename) do
    case File.read("reports/#{filename}") do
      {:ok, result} ->
        result

      {:error, reason} ->
        reason
        # _ -> "caso_qualquer"
    end
  end
end
