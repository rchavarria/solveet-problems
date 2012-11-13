
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class SQLGeneratorTest extends GroovyTestCase {
    
    def sql

    @Before
    public void setUp() {
        sql = new SQLGenerator()
    }

    @Test
    public void testSimpleSelect() {
        check("SELECT * FROM users", sql.table("users").select())
        check("SELECT * FROM groups", sql.table("groups").select())
    }

    private check(expected, actual) {
        assertEquals(expected, actual)
    }

    @Test
    public void testSelectOneColumn() {
        check("SELECT id FROM users", sql.table("users").columns(["id"]).select())
        check("SELECT grants FROM groups", sql.table("groups").columns(["grants"]).select())
    }

    @Test
    public void testSelectSeveralColumns() {
        check("SELECT id, name FROM users", sql.table("users").columns(["id", "name"]).select())
        check("SELECT grants, id, other FROM groups", sql.table("groups").columns(["grants", "id", "other"]).select())
    }

    @Test
    public void testSelectWithCriteria() {
        check("SELECT * FROM users WHERE id=45", sql.table("users").criteria([id: 45]).select())
        check("SELECT * FROM users WHERE name='john'", sql.table("users").criteria([name: "john"]).select())

        check("SELECT * FROM users WHERE id=45 AND name='john'", 
            sql.table("users").criteria([id: 45, name: "john"]).select())
        check("SELECT * FROM users WHERE id=45 AND name='john'", 
            sql.table("users").criteria([name: "john", id: 45]).select())

        check("SELECT * FROM users WHERE groupable='TRUE' AND id=45 AND name='john'", 
            sql.table("users").criteria([name: "john", groupable: true, id: 45]).select())
        check("SELECT * FROM users WHERE groupable='TRUE' AND id=45 AND name='john'", 
            sql.table("users").criteria([groupable: true, name: "john", id: 45]).select())
    }

    @Test
    public void testSimpleDelete() {
        check("DELETE FROM users", sql.table("users").delete())
        check("DELETE FROM groups", sql.table("groups").delete())
    }

    @Test
    public void testDeleteWithCriteria() {
        check("DELETE FROM users WHERE id=45", sql.table("users").criteria([id: 45]).delete())
        check("DELETE FROM users WHERE name='john'", sql.table("users").criteria([name: "john"]).delete())

        check("DELETE FROM users WHERE id=45 AND name='john'", 
            sql.table("users").criteria([id: 45, name: "john"]).delete())
        check("DELETE FROM users WHERE id=45 AND name='john'", 
            sql.table("users").criteria([name: "john", id: 45]).delete())

        check("DELETE FROM users WHERE groupable='TRUE' AND id=45 AND name='john'", 
            sql.table("users").criteria([name: "john", groupable: true, id: 45]).delete())
        check("DELETE FROM users WHERE groupable='TRUE' AND id=45 AND name='john'", 
            sql.table("users").criteria([groupable: true, name: "john", id: 45]).delete())
    }

    @Test
    public void testInsertOneColumn() {
        check("INSERT INTO users (id) VALUES (45)", sql.table("users").criteria([id: 45]).insert())
        check("INSERT INTO users (name) VALUES ('john')", sql.table("users").criteria([name: "john"]).insert())
    }

    @Test
    public void testInsertSeveralColumns() {
        check("INSERT INTO users (id, name) VALUES (45, 'john')", 
            sql.table("users").criteria([id: 45, name: "john"]).insert())
        check("INSERT INTO users (id, name) VALUES (45, 'john')", 
            sql.table("users").criteria([name: "john", id: 45]).insert())

        check("INSERT INTO users (groupable, id, name) VALUES ('TRUE', 45, 'john')", 
            sql.table("users").criteria([name: "john", id: 45, groupable: true]).insert())
    }

    @Test
    public void testUpdateOneColumnOneCriteria() {
        check("UPDATE users SET id=51 WHERE id=45", 
            sql.table("users").newValues([id: 51]).criteria([id: 45]).update())
    }

    @Test
    public void testUpdateSeveralColumnsOneCriteria() {
        check("UPDATE users SET groupable='FALSE', id=51, name='john' WHERE id=45", 
            sql.table("users").newValues([id: 51, name: 'john', groupable: false]).criteria([id: 45]).update())
    }

    @Test
    public void testUpdateSeveralColumnsSeveralCriteria() {
        check("UPDATE users SET groupable='FALSE', id=51, name='john' WHERE id=45 AND name='jack'", 
            sql.table("users").newValues([id: 51, name: 'john', groupable: false]).criteria([id: 45, name: 'jack']).update())
    }
}