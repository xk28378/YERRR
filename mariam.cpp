void BottomUpHeap(vector<int> vec){
  helper(vec,1);
}


[-1,0,0,0,0,0,0,0,0,0]
  0,1,2,3,4,5,6,7,8,9 
[2,3,4,5,6,7,8,9]
void helper(vec, index){
  if(index >= vec.size()){
    return;
  }
  m_heap = []
}

  for (int i = 0; i < int(L1.size()); i++) { 
    cout << L1[i] << " ";    
  }
  cout << end;
  for (int i = 0; i < int(L2.size()); i++) { 
    cout << L2[i] << " ";    
  }
  cout << end;
  for (int i = 0; i < int(vec.size()); i++) { 
    cout << vec[i] << " ";    
  }
  cout << end;
cout << "********** " << vec.front() << " " << index << endl;
  void MINHEAP::BUPhelper(vector<int> vec, int index) {    // cout << m_heap.size() << " " << index << endl;    if (vec.size() == 0) {        return;    }    int first = vec.front();    vec.erase(vec.begin());    int length = vec.size();    vector<int> L1;    vector<int> L2;    for (int i = 0; i < (length) / 2; i++) {        L1.push_back(vec[i]);    }    for (int i = (length) / 2; i < length; i++) {        L2.push_back(vec[i]);    }     for (int i = 0; i < int(L1.size()); i++) {         cout << L1[i] << " ";        }    cout << endl;    for (int i = 0; i < int(L2.size()); i++) {         cout << L2[i] << " ";        }    cout << endl;    for (int i = 0; i < int(vec.size()); i++) {         cout << vec[i] << " ";        }    cout << endl;     cout << "CFISNFSL" << endl;    // cout << vec.size() << " " << L2.size() + L1.size() << endl;    BUPhelper(L1, 2 * index);    BUPhelper(L2, (2 * index) + 1);        cout << first << " " << index << endl;    m_heap[index] = first;        // m_heap.push_back(first);    // it = m_heap.begin() + index;    // m_heap.insert(it, first);        int child = 2 * index;    while (child < int(m_heap.size())) {        if (child + 1 < int(m_heap.size()) && m_heap[child] > m_heap[child + 1]){            child++;        }        if (m_heap[index] <= m_heap[child]){            break;        }        swap(index,child);        index = child;        child = 2 * index;    }    // display();}