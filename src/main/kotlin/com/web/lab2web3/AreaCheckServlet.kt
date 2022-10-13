package com.web.lab2web3

import HitRecord
import HitRecordJson
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import java.time.ZonedDateTime

@WebServlet(name = "checkServlet", value = ["/check"])
class AreaCheckServlet: HttpServlet() {
    public override fun doPost(req: HttpServletRequest, resp: HttpServletResponse) {
        val start = System.nanoTime()
        val out = resp.writer
        val sessionData = req.session.getAttribute("data") as ArrayList<HitRecord>
        //Check Logic
        val x = req.getParameter("x").toFloat()
        val y = req.getParameter("y").toFloat()
        val r = req.getParameter("r").toFloat()
        if (r <= 0 || r > 5) return
        val result: HitResult =
        if (x <= 0) {
            if (y <= 0) checkTriangle(r, x, y)
            else checkCircle(r, x, y)
        } else {
            if (y <= 0) checkRectangle(r, x, y)
            else HitResult.FAIL
        }
        //Create Answer
        val obj = HitRecord(
            ArrayList(listOf( x, y, r )),
            ZonedDateTime.now(),
            (System.nanoTime() - start) / 1000,
            result.str
        )
        sessionData.add(obj)

        val builder = HitRecordJson()
        val record = builder.objToJsonObject(obj)
        out.println(builder.jsonObjectToString(record))
    }

    companion object Checker {
        fun checkCircle(r: Float, x: Float, y: Float): HitResult {
            return if (x*x + y*y <= r/2) HitResult.SUCCESS else HitResult.FAIL
        }
        fun checkTriangle(r: Float, x: Float, y: Float): HitResult {
            return if (y >= (-x)/2 - r/2 && y >= -r) HitResult.SUCCESS else HitResult.FAIL
        }
        fun checkRectangle(r: Float, x: Float, y: Float): HitResult {
            return if (x <= r && y >= -r/2) HitResult.SUCCESS else HitResult.FAIL
        }
    }

    enum class HitResult(val str: String) {
        SUCCESS("Hit"),
        FAIL("Miss")
    }
}