
class DoubleLinkedList {

    DoubleLinkedListNode head
    
    public find(String nodeValue){
        return (head != null) ? head.find(nodeValue) : null
    }
    
    public add(String newValue){
        if(head == null) {
            head = new DoubleLinkedListNode(value: newValue)
        } else {
            head.add(newValue)
        }
        
        return
    }
    
    public values(){
        def list = []
        
        head?.collectValues( { node ->
            list << node.value
            } )
        
        return list
    }
    
    public delete(String deleteValue) {
        //especial case, deleteValue is the value of head
        if(head?.is(deleteValue)){
            head = head.nextNode
            return
        }
        
        head?.delete(deleteValue)
    }
}
