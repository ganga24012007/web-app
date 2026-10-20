<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <html>
        <head>
            <title>Student Details</title>
            <style>
                body {
                    font-family: Arial;
                    margin: 30px;
                    background-color: #f2f6fc;
                }

                h2 {
                    color: darkblue;
                }

                table {
                    border-collapse: collapse;
                    width: 70%;
                    background-color: white;
                }

                th, td {
                    border: 1px solid black;
                    padding: 10px;
                    text-align: left;
                }

                th {
                    background-color: lightblue;
                }

                .section {
                    margin-top: 25px;
                }
            </style>
        </head>

        <body>
            <h2>Student Details</h2>

            <table>
                <tr>
                    <th>Attribute</th>
                    <th>Value</th>
                </tr>

                <tr>
                    <td>Student ID</td>
                    <td><xsl:value-of select="student/@id"/></td>
                </tr>

                <tr>
                    <td>Year</td>
                    <td><xsl:value-of select="student/@year"/></td>
                </tr>

                <tr>
                    <td>Name</td>
                    <td><xsl:value-of select="student/name"/></td>
                </tr>

                <tr>
                    <td>Roll Number</td>
                    <td><xsl:value-of select="student/rollno"/></td>
                </tr>

                <tr>
                    <td>Department</td>
                    <td><xsl:value-of select="student/department"/></td>
                </tr>

                <tr>
                    <td>Email</td>
                    <td><xsl:value-of select="student/email"/></td>
                </tr>
            </table>

            <div class="section">
                <h2>Subjects</h2>
                <ul>
                    <xsl:for-each select="student/subjects/subject">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
            </div>

            <div class="section">
                <h2>Payment</h2>
                <p>
                    Payment Method:
                    <xsl:choose>
                        <xsl:when test="student/payment/card">
                            Card
                        </xsl:when>
                        <xsl:otherwise>
                            Not specified
                        </xsl:otherwise>
                    </xsl:choose>
                </p>
            </div>

            <div class="section">
                <h2>Remarks</h2>
                <p>
                    <xsl:apply-templates select="student/remarks/node()"/>
                </p>
            </div>

            <div class="section">
                <h2>Empty Element</h2>
                <p>
                    <xsl:choose>
                        <xsl:when test="student/emptytag">
                            Empty tag exists.
                        </xsl:when>
                        <xsl:otherwise>
                            Empty tag not found.
                        </xsl:otherwise>
                    </xsl:choose>
                </p>
            </div>

            <div class="section">
                <h2>Extra Information</h2>
                <p>
                    <xsl:value-of select="student/extra/name"/>
                </p>
            </div>

        </body>
        </html>

    </xsl:template>

    <!-- Preserve the bold formatting in remarks -->
    <xsl:template match="bold">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>

    <!-- Display text inside elements -->
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
