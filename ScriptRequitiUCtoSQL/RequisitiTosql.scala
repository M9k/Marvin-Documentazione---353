import java.io._

object RequisitiToSQL {
  def main(args: Array[String]) {
    println("inizio");
    val requisiti = scala.collection.mutable.Set[(String, String, String)]()
    val requisiti_fonti = scala.collection.mutable.Set[(String, String)]()
    val usercase = scala.collection.mutable.Set[(String, String)]()
    val usercase_requisiti = scala.collection.mutable.Set[(String, String)]()

    val fileOut = new PrintWriter(new File("Requisiti.sql" ))
    val file = scala.io.Source.fromFile("RequisitiUC.txt").getLines.mkString("\n")
    val patternR = "\\t(R.*) & (.*) & (.*) & (.*) \\\\".r
    val patternUC = "\\t(UC.[^&]*) & (.[^&]*) & (.*)\n".r
    val patternUCR = "R[^ ]* ".r
    val allMatchesR = patternR.findAllMatchIn(file)
    allMatchesR.foreach { m => {
        requisiti += ((m.group(1), m.group(2), cleanTexTagGloss(m.group(3))))
        requisiti_fonti += ((m.group(1), onlyOneSource(m.group(4))))
      }
    }

    val allMatchesUC = patternUC.findAllMatchIn(file)
    allMatchesUC.foreach { m => {
      usercase += ((m.group(1), m.group(2)))
      for(x <- patternUCR.findAllIn(m.group(3)))
        usercase_requisiti += ((m.group(1), cleanR(x)));
      }
    }

    fileOut.write("Insert into REQUISITI (name, obbligatoriety, description) values \n")
    requisiti.foreach { x => 
      fileOut.write("(\""+x._1+"\", \""+x._2+"\", \""+x._3+"\"), \n")
    }
    fileOut.write(";\n")

    fileOut.write("Insert into UC (name, description) values \n")
    usercase.foreach { x => 
      fileOut.write("(\""+x._1+"\", \""+x._2+"\"), \n")
    }
    fileOut.write(";\n")

    fileOut.write("Insert into UCR (uc, r) values \n")
    usercase_requisiti.foreach { x => 
      fileOut.write("(\""+x._1+"\", \""+x._2+"\"), \n")
    }
    fileOut.write(";\n")
    


    fileOut.close()
    println("fine");
  }

  def onlyOneSource(input:String) :String = {
    input.indexOf(',') match {
      case -1 => input
      case _ => input.substring(0, input.indexOf(','))
    }
  }
  def cleanTexTagGloss(input:String) :String = {
    input.replaceAll("\\\\citGloss\\{","").replaceAll("\\}","").replaceAll("\"" , "\\\\\"")
  }
  def cleanR(input:String) :String = {
    input.replaceAll("\\\\","").replaceAll(" ","")
  }
}

