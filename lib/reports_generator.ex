defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.reduce(%{}, fn line, report ->
      [id, _food_name, price] = parse_line(line)
      Map.put(report, id, price)
    end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, fn elem -> String.to_integer(elem) end)
  end
end
