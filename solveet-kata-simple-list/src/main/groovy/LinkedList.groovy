
class LinkedList {

    LinkedListNode head
    
    public find(String nodeValue){
        (head != null) ? head.find(nodeValue) : null
    }
    
    public add(String nodeValue){
        if(head == null) {
            head = new LinkedListNode(value: nodeValue)
        } else {
            head.add(nodeValue)
        }
    }
    
    public values() {
        def list = []
        
        head?.collectValues( { node ->
            list << node.value
            } )
        
        return list
    }
    
    public delete(String nodeValue){
        //especial case, nodeValue is the value of head
        if(head?.is(nodeValue)){
            head = head.nextNode
            return
        }
        
        LinkedListNode cursor = head
        while(cursor != null){
            LinkedListNode candidate = cursor.nextNode
            if(candidate?.is(nodeValue)){
                cursor.nextNode = candidate?.nextNode
                return
            }
            cursor = cursor.nextNode
        }
    }
}
