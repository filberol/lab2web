import java.time.ZonedDateTime

data class HitRecord(
    val Cords: ArrayList<Float>,
    val Time: ZonedDateTime,
    val Execution: Long,
    val Result: String
)
