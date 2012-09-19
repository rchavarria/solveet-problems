
class LinkedLoopList {

    def head
    
    def find(String nodeValue){
        if(head?.is(nodeValue)){
            return head.value
        }
        
        def cursor = head?.nextNode
        while(cursor != head) {
            if(cursor.is(nodeValue)){
                return cursor.value
            }
            cursor = cursor.nextNode
        } 
        
        return null
    }
 
    def add(String newValue){
        if(head == null){
            head = new LinkedLoopListNode(value: newValue)
            head.nextNode = head
            return
        }
        
        def tail = findTail()
        def nextNode = new LinkedLoopListNode(value: newValue)
        tail.nextNode = nextNode
        nextNode.nextNode = head
    }   
    
    private findTail(){
        def cursor = head
        while(true){
            if(cursor.nextNode == head){
                return cursor
            }
            cursor = cursor.nextNode
        }
    }
    
    def values() {
        def list = []
        
        if(head != null){
            list << head.value
        }
        def cursor = head?.nextNode
        while(cursor != head){
            list << cursor.value
            cursor = cursor.nextNode
        }
        
        return list
    }
    
    def delete(String deleteValue){
        deleteHead(deleteValue)
        
        def cursor = head?.nextNode
        def previousNode = head
        while(cursor != head){
            if(cursor.is(deleteValue)){
                previousNode.nextNode = cursor.nextNode
                return
            }
            previousNode = cursor
            cursor = cursor.nextNode
        }
    }
    
    private deleteHead(def deleteValue){
        if(head.is(deleteValue)){
                if(head.nextNode == head){
                    head = null
                    return
                }
                
                def tail = findTail()
                head = head.nextNode
                tail.nextNode = head
        }
    }
}
