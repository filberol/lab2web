import jakarta.json.Json
import jakarta.json.JsonObject
import java.io.StringWriter
import java.time.format.DateTimeFormatter

class HitRecordJson {
    private val formatter: DateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss")
    private val execScale: String = " mSec"

    fun objToJsonObject(record: HitRecord): JsonObject {
        return Json.createObjectBuilder()
            .add("coordinates", record.Cords.toString())
            .add("timeZoned", record.Time.format(formatter))
            .add("execution", record.Execution.toString() + execScale)
            .add("resulted", record.Result).build()
    }

    fun arrayToJsonObject(array: ArrayList<out Any>): JsonObject {
        val jsonBuilder = Json.createObjectBuilder()
        val arrayBuilder = Json.createArrayBuilder()
        for (element in array) {
                arrayBuilder.add(objToJsonObject(element as HitRecord))
        }
        jsonBuilder.add("data", arrayBuilder)
        return jsonBuilder.build()
    }

    fun jsonObjectToString(obj: JsonObject): String {
        val writer = StringWriter()
        Json.createWriter(writer).write(obj)
        return writer.toString()
    }
}