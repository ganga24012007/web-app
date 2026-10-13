<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <html>
            <head>
                <title>College Details</title>
            </head>

            <body>
                <h1>College Details</h1>

                <h2>College Information</h2>

                <p>
                    <b>College ID: </b>
                    <xsl:value-of select="college/@collegeId"/>
                </p>

                <p>
                    <b>College Name: </b>
                    <xsl:value-of select="college/collegeName"/>
                </p>

                <p>
                    <b>City: </b>
                    <xsl:value-of select="college/location/@city"/>
                </p>

                <p>
                    <b>State: </b>
                    <xsl:value-of select="college/location/@state"/>
                </p>

                <h2>Student Details</h2>

                <table border="1" cellpadding="8">
                    <tr>
                        <th>ID</th>
                        <th>Year</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Age</th>
                        <th>Department</th>
                        <th>Email</th>
                        <th>Skills</th>
                        <th>Active</th>
                    </tr>

                    <xsl:for-each select="college/students/student">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="@year"/></td>
                            <td><xsl:value-of select="name/firstName"/></td>
                            <td><xsl:value-of select="name/lastName"/></td>
                            <td><xsl:value-of select="age"/></td>
                            <td><xsl:value-of select="department"/></td>
                            <td><xsl:value-of select="email"/></td>

                            <td>
                                <xsl:for-each select="skills/skill">
                                    <xsl:value-of select="."/>

                                    <xsl:if test="position() != last()">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>

                            <td><xsl:value-of select="active"/></td>
                        </tr>
                    </xsl:for-each>

                </table>

                <h2>Course Details</h2>

                <table border="1" cellpadding="8">
                    <tr>
                        <th>Course Code</th>
                        <th>Course Title</th>
                        <th>Credits</th>
                    </tr>

                    <xsl:for-each select="college/courses/course">
                        <tr>
                            <td><xsl:value-of select="@code"/></td>
                            <td><xsl:value-of select="title"/></td>
                            <td><xsl:value-of select="credits"/></td>
                        </tr>
                    </xsl:for-each>

                </table>

                <h2>Description</h2>
                <p>
                    <xsl:value-of select="college/description"/>
                </p>

                <h2>Note</h2>
                <p>
                    <xsl:value-of select="college/note"/>
                </p>

            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>