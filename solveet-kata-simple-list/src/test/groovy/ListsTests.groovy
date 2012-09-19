
import static org.junit.Assert.*

import org.junit.Before;
import org.junit.Test


class ListsTests extends GroovyTestCase {

    def list
    
    @Test
    public void testFindInAnEmptyListReturnNull() {
        assertNull list.find("fred")
    }
    
    @Test
    public void testFindReturnAString(){
        list.add("fred")
        
        assertEquals("fred", list.find("fred"))
        assertNull list.find("wilma")
    }
    
    @Test
    public void testFindReturnTheSearchedString(){
        list.add("fred")
        
        assertEquals("fred", list.find("fred"))
        assertNull list.find("wilma")
        
        list.add "wilma"
        assertEquals("fred", list.find("fred"))
        assertEquals("wilma", list.find("wilma"))
    }

    @Test
    public void testValuesReturnsAList(){
        list.add "fred"
        list.add "wilma"
        
        assertEquals(["fred", "wilma"], list.values())
    }
    
    @Test
    public void testDeleteDeletesTheMatchingNode() {
        list.add "fred"
        list.add "wilma"
        list.add "betty"
        list.add "barney"
        assertEquals(["fred", "wilma", "betty", "barney"], list.values())
        
        list.delete "wilma"
        assertEquals(["fred", "betty", "barney"], list.values())
        
        list.delete(list.find("barney"))
        assertEquals(["fred", "betty"], list.values())
        
        list.delete("fred")
        assertEquals(["betty"], list.values())
        
        list.delete "betty"
        assertEquals([], list.values())
    }
}